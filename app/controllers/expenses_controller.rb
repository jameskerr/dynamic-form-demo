class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[ show edit update destroy ]

  # GET /expenses or /expenses.json
  def index
    @expenses = Expense.all
  end

  # GET /expenses/1 or /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
    @expense.schedules.build 
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses or /expenses.json
  def create
    @expense = Expense.new(expense_params)
    
    if params["commit"] == "refresh"
      render :new, status: :unprocessable_entity
    elsif @expense.save
      redirect_to expense_url(@expense), notice: "Expense was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /expenses/1 or /expenses/1.json
  def update
    if @expense.update(expense_params)
      redirect_to expense_url(@expense), notice: "Expense was successfully updated." 
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  # DELETE /expenses/1 or /expenses/1.json
  def destroy
    @expense.destroy!

    respond_to do |format|
      format.html { redirect_to expenses_url, notice: "Expense was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def expense_params
      params
        .require(:expense)
        .permit(
          :name, 
          schedules_attributes: [
            :id,
            :interval, 
            :amount,
            :frequency,
            :repeats,
            :started_at,
            :by_monthday => [],
          ]
        )
    end
end
