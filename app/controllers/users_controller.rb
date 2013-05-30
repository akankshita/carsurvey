class UsersController < ApplicationController
  skip_before_filter :check_login,:only=>[:sign_in,:sign_in_act,:sign_up,:sign_up_act,:checkmail]
  def index
  end
  def sign_in
    render :layout => 'sign_in'
  end

  def sign_up
    render :layout => 'sign_in'
  end

  def sign_in_act
    
    @user_info = User.find_by_email(params[:email])
    if !@user_info.nil?
     
        if @user_info.password == params[:pswd]
          $id = @user_info.id
          $name = @user_info.name
          session[:id] = @user_info.id
          session[:name] = @user_info.name
          flash[:smsg] = "Login sucessfully"
          redirect_to "/welcome"
        else
          flash[:msg] = "Invalid Password"
          render :action => :sign_in ,:layout => 'sign_in'
        end
    else
      flash[:msg] = "Invalid Email/Password combination"
      render :action => :sign_in ,:layout => 'sign_in'
    end
  end

  def sign_up_act
   # render :text => 'aka' and return false
    @user = User.new(params['user'])
    if @user.save
      flash[:smsg] = "Sign Up sucessfully"
      redirect_to "/"
    else
      render :action => :sign_up ,:layout => 'sign_in'
    end
  end
  def welcome
    @user_info = User.find( session[:id])
  end

  def question1
  end

  def question2
    @user_info = User.find( session[:id])
    @address = @user_info.address1 + ','+@user_info.address2+','+ @user_info.zipcode
  end

  def question3
    if params[:user][:prize] == "yes"
      redirect_to "/question4"
    else
    end
  end

  def question4
    @user_info = User.find( session[:id])
    
    @user_info.update_attributes(params[:user])
    
  end

  def question5
    #render :text =>  params[:user][:name].inspect and return false
    if params[:user][:name] == "no"
      #redirect_to "/question5"
    else
      redirect_to "/question6"
    end
    
  end

  def question6
   # render :text => params.inspect and return false
    if !params[:user].nil?
      @user_info = User.find( session[:id])
      @user_info.update_attributes(params[:user])
    end
  end

  def question7
    @user_info = User.find( session[:id])
    @dyear = Time.now.year#@user_info.dob.year
     @mydyear = @user_info.dob.year
    if @dyear.to_i - params[:user][:year].to_i < 18
      redirect_to "/disqualified"
    elsif (@mydyear == $byear.to_i)
      $bmatch = 'yes'
      redirect_to '/question8'
    else
      $byear = params[:user][:year]
  #    render :text =>  $byear.inspect and return false
      #redirect_to "/question8"
    end
  end
  def question8
   # render :text => $byear.inspect and return false
    @user_info = User.find( session[:id])
    @dyear = Time.now.year#@user_info.dob.year
   if ($bmatch == 'yes')

   else
    if (params[:user][:dob].to_i != $byear.to_i) or (@dyear - params[:user][:dob].to_i < 18)
      redirect_to "/disqualified"

    else
      @cdate = @user_info.dob.day
      @cmonth = @user_info.dob.month
      @cyear = params[:user][:dob]
      params[:user][:dob] = @cyear.to_s+'-'+@cmonth.to_s+'-'+@cdate.to_s
      @user_info.update_attributes(params[:user])
    end
  end
  end
  def question9
    if params[:user][:kid].to_i > 0
      @kidno = params[:user][:kid].to_i 
    else
      redirect_to "/brandinterest"
    end
  end

  def qualified
  end
  def disqualified
  end
  def brandinterest
    
  end
  def brandinterest_save
    @brands=[]
    if !params[:user][:brands].nil?
      @brands = params[:user][:brands]
     
      if @brands.size == 1 and params[:user][:brands][0] == "Other"
        redirect_to "/disqualified"
      else
        redirect_to "/vehicleinterest"
      end
    else
    redirect_to "/vehicleinterest"
    end
  end
  def vehicleinterest_save
     @brands=[]
    if !params[:user][:vehicle].nil?
      @brands = params[:user][:vehicle]
     
      if @brands.size == 1 and params[:user][:vehicle][0] == "Other"
        redirect_to "/disqualified"
      elsif  @brands.size > 1
        redirect_to "/vehiclepreference"
      else
        redirect_to "/inmarket"
      end
    else
    redirect_to "/inmarket"
    end

  end
  def vehicleinterest
  end
  
  def vehiclepreference
  end
  
  def inmarket
  end
  def inmarket_save
    if params[:user][:buy_car] == 'no'
      redirect_to "/currentcar"
    else
       redirect_to "/buylease"
    end
  end
  def buylease
  end
  def buylease_save
  end

  def currentcar
  end

  def checkmail
    @user_info = User.find_by_email(params['email'])
    if @user_info.nil?
      render :text => 'notexist'
    else
      render :text => 'exist'
    end
  end

  def sign_out
    session[:id] = nil
    session[:name] = nil
   
    flash[:smsg] = "You are now logged out"
    redirect_to "/"
  end
  
end
