class SessionsController < ApplicationController
  def new
  end

  def create
    person = Person.find_by(email: params[:session][:email].downcase)
    if person && person.authenticate(params[:session][:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      log_in person
      redirect_to person
      # redirect_to person_url(person)
    else
      # エラーメッセージを作成する
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end