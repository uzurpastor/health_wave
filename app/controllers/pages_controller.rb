# frozen_string_literal: true

# Controller for static pages
class PagesController < ApplicationController
  skip_before_action :authenticate_account!

  def home; end
end
