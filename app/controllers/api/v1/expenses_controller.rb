module Api::V1
  class ExpensesController < ApplicationController
    before_action :set_expense, only: %i[ show ]
    skip_before_action :verify_authenticity_token

    # GET /expenses or /expenses.json
    def index
      @expenses = Expense.where(user: params[:user_id])
      render json: @expenses.as_json
    end

    # GET /expenses/1 or /expenses/1.json
    def show
      @expense = Expense.find(params[:id])
      render json: @expense.as_json
    end

    # POST /expenses or /expenses.json
    def create
      @expense = Expense.new(expense_params)

      if @expense.save
        render json: @expense.as_json
      else
        render json: @expense.errors, status: :unprocessable_entity
      end
    end

    def summary
      @total_expenses_amount = { total_expenses_amount: Expense.where(user: params[:user_id]).sum(:amount_in_pennies) }
      render json: @total_expenses_amount.as_json
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def expense_params
      params.require(:expense).permit(:user_id, :amount_in_pennies)
    end
  end
end
