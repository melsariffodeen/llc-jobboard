class Admin::AdminAreaController < ApplicationController
  before_action :authenticate_admin!
end
