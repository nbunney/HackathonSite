class DocumentsController < ApplicationController
  ALLOWED_DOCUMENTS = %w[code-of-conduct privacy-policy terms-of-service]
  ALLOWED_RULESETS = %w[full mini]

  def about; end

  def show
    ALLOWED_DOCUMENTS.include?(params[:doc]) or not_found!

    render params[:doc]
  end

  def rules
    ALLOWED_RULESETS.include?(params[:type]) or not_found!

    render "rules/#{params[:type]}"
  end
end
