class UsersController < ApplicationController
        before_action :set_user, only: [:only , :show , :update , :destroy]
        before_action :require_user, only: [:edit , :update]
        before_action :require_same_user , only: [:edit , :update , :destroy]

        def show
                
                @articles = @user.articles.paginate(page: params[:page], per_page: 3)
        end

        def index
                @users = User.paginate(page: params[:page], per_page: 3)
        end

        def new
                @user = User.new
        end

        def edit
                @user = User.find(params[:id])
        end
        
        def update
                @user = User.find(params[:id])
                if @user.update(user_params)
                        flash[:notice] = "your account was successfully updated"
                        redirect_to @user
                else
                        render 'edit'
                end
        end

       

        

        def create
                @user= User.new(user_params)
                if @user.save
                        session[:user_id] = @user.id 
                        flash[:notice] = "welcome to Alpha Blog #{@user.username} , You have successfully SIGNED UP "
                        redirect_to users_path
                else
                        render 'new'
                end
        end


        def destroy
                @user.destroy
                session[:user_id] = nil if @user == current_user
                flash[:notice] = "Account and all assoiated articles sucessfully deleted"
                redirect_to articles_path
        end

        private

        def user_params
                params.require(:user).permit(:username, :email, :password)
        end

        def set_user
            @user = User.find(params[:id])
        end

        def require_same_user
           if current_user != @user && !current_user.admin?
                flash[:alert] = "you can only edit or delete your account"
                redirect_to user_path
           end
        end
end