class SessionsController < ApplicationController

    def create
        # login
        user = User.find_by(:username => params[:username])
        if user&.authenticate(params[:password])
            # add session
            session[:user_id] = user.id
            render json: user, status: :success
        else
            render json: {error: "Invalid username or password"}, status: :unauthorized
        end
    end

    def destroy
        session.delete :user_id
        head :no_content
    end
end

# def create
#     person = Person.create!(person_params)
#     render json: person, status: :created
#     rescue ActiveRecord::RecordInvalid => invalid
#     render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
#     end