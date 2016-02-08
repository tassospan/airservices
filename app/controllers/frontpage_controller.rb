class FrontpageController < ApplicationController
    def index
        @box_one = Welcome.first
        @box_two = Welcome.second
        @box_three = Welcome.last
        @social = Social.first
    end
end
