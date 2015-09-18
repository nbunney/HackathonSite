class DocumentsController < ApplicationController
  ALLOWED_DOCUMENTS = %w[code-of-conduct privacy-policy terms-of-service]
  ALLOWED_RULESETS = %w[full mini]

  def about; end

  def show
    ALLOWED_DOCUMENTS.include?(params[:doc]) or not_found!
    template = params[:doc]

    @contact = "me@plejeck.com"

    render template if stale?(@contact, template: template, public: true)
  end

  def rules
    ALLOWED_RULESETS.include?(params[:type]) or not_found!
    template = "documents/rules/#{params[:type]}"

    render template if stale?(template: template, public: true)
  end
end
