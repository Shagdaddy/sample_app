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
        case @submission.delta
		  when 1
		    @submission.stage = 10
		  when 2
		    @submission.stage = 50
		  when 3
		    @submission.stage = 100		  
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
