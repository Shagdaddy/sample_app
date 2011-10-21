class SubmissionsController < ApplicationController

  def index
    test_for_admin = User.find(self.current_user.id).admin
	if test_for_admin
#
	else
#
	end
#   OLD STATEMENT - @submissions = Submission.all

#    respond_to do |format|
#      format.html # index.html.erb
#      format.json { render :json => @orders }
#    end
  end

  def show
    @submissions = Submission.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @submissions }
    end
  end

  def new
    @submission = Submission.new
	@submission.order_id = params[:oid]
	@submission.stage = 200 + params[:os].to_i
	@submission.save

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @submission }
    end
  end

  def edit
    @submission = Submission.find(params[:id])
#	@submission.comments = Time.now.strftime("%m.%d.%Y - \n\n") + @submission.comments
	@submission.delta = 0
  end

  def create
    @submission = Submission.new(params[:submission])
	
    respond_to do |format|
      if @submission.save
        format.html { redirect_to "/orders/"+@submission.order_id.to_s, :notice => 'Submission was successfully created.' }
        format.json { render :json => @submission, :status => :created, :location => @submission }
      else
        format.html { render :action => "new" }
        format.json { render :json => @submission.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /submissions/1
  def update
    @submission = Submission.find(params[:id])

    respond_to do |format|
	  if @submission.update_attributes(params[:submission])
	    # Here we process the staging change that the REQUESTOR made against this candidate for this order
        # .delta will be 1 if REQUESTOR wants the candidate to proceed to the next stage or 3 if the REQUESTOR no longer wants to consider candidate 
		# .delta will be 2 if the REQUESTOR makes no decision
        case @submission.delta
		  when 1
		    # Here we need to figure out how much to increase the STAGE value by.
			# Default of 10 for anything other than the initial or final graduations.
			# If this is the first graduation, then the first digit of the 3-digit stage will be a 2.
			# If this is the last graduation (meaning the candidate is being hired for this order), 
			#   then the 2nd digit will be 1 less than that third digit.
			# Example for hire: current stage = 346. The '3' means the candidate is active 
			#   ('2' is only for initial and '1' means their submission has ceased)
			# The '4' means they are currently at the 4th stage.  the '5' means there are 5 stages total.
			# With a trigger here to graduate to HIRED (.delta = 1), 
			#   the candidate's stage only increases to stage 356 (active, 5th of 6th stages).
			# But if the current stage = 356, then the algorithm below will set the 
			#   new stage value to 400 (which means HIRED)
		    stage_inc = 10
		    if (@submission.stage/100).to_i == 2
			  stage_inc = 110
			end
			fl = @submission.stage - (@submission.stage/100)*100
			if (fl - (fl/10).to_i*10 - 1).to_i == (fl/10).to_i
			  stage_inc = 400 - @submission.stage
			end
		    @submission.stage = @submission.stage + stage_inc
		  when 2
		    # no change
		  when 3
		    stage_dec = 190
		    if (@submission.stage/100).to_i == 2
			  stage_dec = 90
			end
		    @submission.stage = @submission.stage - stage_dec  
		end
	    @submission.user_id = Candidate.find(@submission.candidate_id).user_id
		@submission.save
#        format.html { redirect_to @submission, :notice => 'Submission was successfully updated.' }
        format.html { redirect_to "/orders/"+@submission.order_id.to_s, :notice => 'Submission was successfully updated.' + @submission.delta.to_s}
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @submission.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy

    respond_to do |format|
      format.html { redirect_to submissions_url }
      format.json { head :ok }
    end
  end

end
