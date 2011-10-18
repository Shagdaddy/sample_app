class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
	    # Using the logged-in user ID -> extrapolate ID, Company associated to user and current job count to save in this new Order record
	    @order.user_id = self.current_user.id
		cmp = self.current_user.company_id
	    cnt = "00000" + Company.find(cmp).jobcount.to_s
		# increase the jobcount field for this company to avoid duplicates
		increase_jobcount
		# update the order_id field in the format AAAAA##### where AAAAA is the abbr associated with company and ##### is the current order ID
        @order.order_id = Company.find(cmp).abbr + cnt[-5..-1]

		@order.save
        format.html { redirect_to @order, :notice => 'Order was successfully created.' }
        format.json { render :json => @order, :status => :created, :location => @order }
      else
        format.html { render :action => "new" }
        format.json { render :json => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, :notice => 'Order was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :ok }
    end
  end
  
  private

    def increase_jobcount
	  whichcomp = self.current_user.company_id
      bumpjc = Company.find(whichcomp)
	  bumpjc.jobcount = bumpjc.jobcount + 1
	  bumpjc.save
    end
  
end
