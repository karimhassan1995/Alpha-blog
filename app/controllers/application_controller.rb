class ApplicationController < ActionController::Base

    helper_method :current_user , :logged_in
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]   

    end
        # x = 0
        # @current_user = @current_user || User.find(session[:user_id]) if session[:user_id]

    
                                     #    شرح من ساجد للمعادلة اللي فوق
    #     if (@current_user == nil) # If this is the first time to call this function
    #         if (session[:user_id] != nil) # If Some one id logged in
    #             @current_user = User.find(session[:user_id])
    #             return @current_user
    #         else # No one is logged in, return nil
    #             @current_user = nil
    #             return @current_user
    #         end
    #     else # This function is called before (The current user is already calculated, so return it)
    #         return @current_user
    #     end
   


# instance variable = variable of an instance = attribute

# شرح من ساجد للمعادلة اللي فوق
# class Test {
#   User current_user = null;

#   User f1() {
#     if (current_user == null) {
#       current_user = new User();
#       return current_user;
#     }
#     else {
#       return current_user;
#     }
#   }
# }

# public static void main(String[] arg) {
#   Test test = new Test();
#   test.f1();
#   test.f1();
# }

# 7    def logged_in
#         !!current_user
#     end
        # شرح من ساجد للميثود اللي فوق ا
    # x = true
    # y = false
    # z = !true
    # p = !false
    # l = !!true
    # t = !!false
    # v = nil
    # b = !nil
    
    # d = User.new


    # i = !!User.new
    # f = !!nil

    # !!@curent_uset
    # !! العلامة ده بتخلي المتغير boolean

     def logged_in
        !!current_user
    end

    def require_user
        if !logged_in
            flash[:alert]= "yon must be logged in to perform that action"
            redirect_to login_path
        end
    end

    def hello
        
    end

    def home
        redirect_to articles_path if logged_in
    end

end
