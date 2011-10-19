class CandidatesController < ApplicationController
  # GET /candidates
  # GET /candidates.json
  def index
    test_for_admin = User.find(self.current_user.id).admin
	if test_for_admin
	  @candidates = Candidate.all
	else
	  @candidates = Candidate.where(:user_id => self.current_user.id)
	end
#   OLD STATEMENT - @candidates = Candidate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @candidates }
    end
  end

  # GET /candidates/1
  # GET /candidates/1.json
  def show
    @candidate = Candidate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @candidate }
    end
  end

  # GET /candidates/new
  # GET /candidates/new.json
  def new
    @candidate = Candidate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @candidate }
    end
  end

  # GET /candidates/1/edit
  def edit
    @candidate = Candidate.find(params[:id])
  end

  # POST /candidates
  # POST /candidates.json
  def create
    @candidate = Candidate.new(params[:candidate])

    respond_to do |format|
      if @candidate.save

	    # Using the logged-in user ID -> extrapolate User_ID associated to user and save in this new Candidate record
	    @candidate.user_id = self.current_user.id
		@candidate.save
        format.html { redirect_to @candidate, :notice => 'Candidate was successfully created.' }
        format.json { render :json => @candidate, :status => :created, :location => @candidate }
      else
        format.html { render :action => "new" }
        format.json { render :json => @candidate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /candidates/1
  # PUT /candidates/1.json
  def update
    @candidate = Candidate.find(params[:id])

    respond_to do |format|
      if @candidate.update_attributes(params[:candidate])
        format.html { redirect_to @candidate, :notice => 'Candidate was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @candidate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /candidates/1
  # DELETE /candidates/1.json
  def destroy
    @candidate = Candidate.find(params[:id])
    @candidate.destroy

    respond_to do |format|
      format.html { redirect_to candidates_url }
      format.json { head :ok }
    end
  end
end
