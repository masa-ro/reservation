class LoginController < ApplicationController
    def login
        # @user = User.new(login_id:params["login_id"], password:params["password"])

        # i = 1
        # while i <= User.size
        #     if User.find(i) == @user
        #         format.html { redirect_to '/rooms', notice: 'Login was successful.' }       
        #     else
        #         format.html { redirect_to '/login.html', notice: 'Room was not successful.' }
        #     end
        # end

        # ユーザーの入力値が正しいかどうか
        login_id = params["login_id"];
        password = params["password"];

        # データベースを確認
        @user = User.where("login_id = ? and password = ?", login_id, password)[0];
        
        # jsonによる確認
        # @user = User.new
        # @user.login_id = login_id
        # @user.password = password
        # render json: @user;

        if @user
            session[:user] = @user
            redirect_to '/rooms'
        else
            redirect_to '/login.html'
        end
    end

    def logout
        session[:user] = nil
        redirect_to '/login.html'
    end

    def login2
        login_id = params["login_id"]
        password = params["password"]

        @user = User.where("login_id = ? and password = ?", login_id, password)[0]

        if @user
            redirect_to '/rooms'
            session[:user] = @user
        else
            redirect_to '/login2.html'
        end
    end
end
