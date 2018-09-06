module Users
  class User
    class << self
      def create(params = {})
        user = ::User.new.tap do |u|
          u.account_id = params[:account_id]
          u.email = params[:email]
          u.password = params[:password]
        end

        if user.save
          {
            success: true,
            user: {
              id: user.id,
              email: user.email
            }
          }
        else
          {
            errors: user.errors.full_messages
          }
        end
      end
    end
  end
end
