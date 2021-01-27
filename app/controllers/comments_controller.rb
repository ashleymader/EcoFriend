class CommentsController < ApplicationController
    # before_action :find_comment, only: [:new, :index]
    # before_action :find_user

    def new
        # if @brand = Brand.find_by_id(params[:brand_id]) 
        #     @comment = @brand.comments.build 
        # else
            if params[:brand_id]
                @brand = Brand.find_by_id(params[:brand_id])
                @comments = @brand.comments
            else
                @comment = Comment.new 
            # @comment.user = current_user 
        end 
    end  

    def create
        @comment = Comment.new(comment_params) 
        binding.pry
        # @comment.user_id = current_user 
        # binding.pry
         if @comment.save # returns the same true or false as .valid 
             redirect_to comment_path(@comment)
         else 
             render :new # new review not showing? 
         end 
     end 

    def show
        @comment = Comment.find_by_id(params[:id])
    end 

    def index 
        if @brand = Brand.find_by_id(params[:brand_id]) 
            @comments = @brand.comments 
        else 
            @comments = Comment.all
        end
    end 

    private 

    def comment_params 
        params.require(:comment).permit(:user_id, :brand_id, :review)
    end 

    def find_user
        @user = current_user
        binding.pry 
    end
    
end 

