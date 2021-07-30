class UsersController < ApplicationController
    # skip_before_action :authorize, only: :create

    def create
        user = User.create!(user_params)
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    # def create
    #     user = User.create(user_params)
    #     if user.valid?
    #         session[:user_id] = user.id
    #         render json: user.id, user.username, user.image_url, user.bio, status: :created
    #     else
    #         render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
    #     end
    # end

    private
    def user_params
        params.permit(:username, :password_digest, :password_confirmation,:image_url, :bio )
    end

    
end


# rescue ActiveRecord::RecordInvalid => invalid
#     render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity