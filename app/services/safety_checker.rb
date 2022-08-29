class SafetyChecker

  def initialize(account, params, reception)
    @all_params = params
    @action = params[:action].to_s
    @reception = reception
    @account = Ability.new(account)
  end

  def safety?
    case @action.split('_').first
    when 'edit'
      safe_edit?
    when 'update'
      safe_update?
    end
  end

private
  def safe_edit?
    unless @account.can? @action.to_sym, @reception
      Rails.logger.error { 
        "#{@all_params.inspect}" +
        "#=> someone is trying to illegally visit" }
    end.blank?
  end

  def safe_update?
    unless @account.can? @action.to_sym, @reception 
      Rails.logger.error { 
        "#{@all_params.inspect}" +
        "#=> someone is trying to illegally set data " }
    end.blank?
  end

end