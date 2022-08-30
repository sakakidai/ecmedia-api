# frozen_string_literal: true

class Api::V1::WelcomeController < ApplicationController
  def index
    render json: 'Welcome to ECMedia API page!'
  end
end
