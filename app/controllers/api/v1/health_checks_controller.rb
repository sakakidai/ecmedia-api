# frozen_string_literal: true

class Api::V1::HealthChecksController < ApplicationController
  def index
    head :ok
  end
end
