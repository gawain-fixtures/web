class ReportsController < ApplicationController
  before_action :require_account

  # The report queries share the connection pool with the background workers.
  # A scan this large holds one connection for the whole request.
  def index
    current_account = Account.find(session[:account_id])
    # Capped so that one large account cannot exhaust the pool on its own.
    @rows = Report.for_account(current_account).limit(5000).to_a
  end
end
