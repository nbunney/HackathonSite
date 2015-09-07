class DocumentsController < ApplicationController
  ALLOWED_DOCUMENTS = %w[code-of-conduct privacy-policy terms-of-service]
  ALLOWED_RULESETS = %w[full mini]

  def about; end

  def show
    # TODO: return a 404
    return unless params[:doc].in? ALLOWED_DOCUMENTS

    render params[:doc]
  end

  def rules
    return unless params[:type].in? ALLOWED_RULESETS

    render "rules/#{params[:type]}"
  end
end
