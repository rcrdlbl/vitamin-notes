class Helpers
  def self.current_user(session_hash)
    user = User.find_by(id: session_hash[:user_id])
    user
  end

  def self.logged_in?(session_hash)
    if !!current_user(session_hash)
      return true
    else
      return false
    end
  end

  def self.redirect_if_not_logged_in(session_hash)
    if !logged_in?(session_hash)
      redirect "/login"
    end
  end
end
