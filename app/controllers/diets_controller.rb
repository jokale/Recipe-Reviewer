class DietsController < ApplicationController

    def index
        @diets = Diet.asc_order

        # Diet.where("ORDER(category) ASC")
        # Diet.order(category: :asc)
    end 

end
