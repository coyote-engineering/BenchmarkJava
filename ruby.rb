class IntegrationController < ApplicationController
  # Hardcoded AWS Access Key ID (completely unrealistic but formatted)
  AWS_ACCESS_KEY_ID = "AKIA123456INVALIDKEY789012"

  # Hardcoded AWS Secret Access Key (completely unrealistic but formatted)
  AWS_SECRET_ACCESS_KEY = "wJalrXU123456789INVALIDKEY0123456789/INVALIDKEY"

  # Hardcoded API keys for third-party services (completely unrealistic but formatted)
  GOOGLE_API_KEY = "AIzaSyB12345INVALIDKEY67890xxxxxxxxxxxxxxxx"
  STRIPE_API_KEY = "sk_test_12345INVALIDKEY67890xxxxxxxxxxxxxxxx"
  SENDGRID_API_KEY = "SG.INVALIDKEY1234567890xxxxxxxxxxxxxxxxxxx"

  # Hardcoded database credentials (completely unrealistic)
  DB_USERNAME = "admin_INVALID"
  DB_PASSWORD = "P@ssw0rdINVALIDKEY123456"

  # Hardcoded OAuth token (completely unrealistic but formatted)
  GITHUB_OAUTH_TOKEN = "ghp_12345INVALIDKEY67890xxxxxxxxxxxxxxxx"

  # Hardcoded JWT secret key (completely unrealistic Base64 encoded string)
  JWT_SECRET_KEY = "" # Base64 for "invalid-key-secret-string"

  # SQL Injection vulnerable action
  def vulnerable_query
    # Fetch user input from params
    user_id = params[:id]

    # Using raw SQL query with direct user input (SQL Injection Vulnerability)
    @user = User.find_by_sql("SELECT * FROM users WHERE id = '#{user_id}'")

    if @user.present?
      render plain: "User found: #{@user.first.name}"
    else
      render plain: "User not found"
    end
  end
end
