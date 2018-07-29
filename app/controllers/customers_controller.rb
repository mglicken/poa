class CustomersController < ApplicationController

 
  def index
    @customers = Customer.all.order("property_name ASC")
    respond_to do |format|
      format.html
      format.csv {send_data @customers.to_csv }
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new

    @customer.property_name = params[:property_name]
    @customer.occupancy_id = params[:occupancy_id]
    @customer.address_1 = params[:address_1]
    @customer.address_2 = params[:address_2]
    @customer.city = params[:city]
    @customer.state = params[:state]
    @customer.zip = params[:zip]

    if @customer.save
      redirect_to "/customers", :notice => "Customer created successfully."
    else
      render 'new'
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])

    @customer.property_name = params[:property_name]
    @customer.occupancy_id = params[:occupancy_id]
    @customer.address_1 = params[:address_1]
    @customer.address_2 = params[:address_2]
    @customer.city = params[:city]
    @customer.state = params[:state]
    @customer.zip = params[:zip]

    if @customer.save
      redirect_to "/customers/#{@customer.id}/", :notice => "Customer updated successfully!"
    else
      render 'edit'
    end
  end

  def destroy
    @customer = Customer.find(params[:id])

    @customer.destroy

    redirect_to "/customers", :notice => "Customer deleted."
  end

  def import
    Customer.import(params[:file])
    redirect_to "/models/", notice: "Customers imported"
  end

end
