class UsuarioSessionsController < ApplicationController
before_filter :authenticate, :only => :destroy

  def new
    @usuario_session = UsuarioSession.new
  end

  def create

    u = Usuario.find_by_login(params[:usuario_session][:login])
    if u.nil?
      @user = Usuario.create(:login => params[:usuario_session][:login], :email => params[:usuario_session][:login] + "@uach.mx", :password => "123pum", :password_confirmation => "123pum")
      @user.add_role "encuestado"
      @user.save
      @encuestado= Encuestado.create(:login => @user.login, :email => @user.email, :session_id => request.session_options[:id])
    end

    @usuario_session = UsuarioSession.new(params[:usuario_session])

    if @usuario_session.save
      redirect_back_or root_path
    else
      @user.delete if u.nil?
      @encuestado.delete if u.nil?
      render :action => :new
    end
  end


  def destroy
    current_usuario_session.destroy
    redirect_to new_usuario_session_path
  end

  private
  
    def redirect_back_or(default)
      redirect_to(session[:return_to] || default)
      session.delete(:return_to)
    end
end
