class TransactionsController < ApplicationController
  def create
    @transaction = current_user.transactions.build(transaction_params)
    if @transaction.save
      redirect_to root_url
    else
      render {html: "ERROR"}
    end
  end

  private
  def transaction_params
    params.require(:transaction).permit(:credit, :debit, :source)
  end
end
