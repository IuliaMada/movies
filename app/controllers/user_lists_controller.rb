class UserListsController < ApplicationController
  before_action :set_user_list, only: [:show, :edit, :update, :destroy]

  # GET /user_lists
  # GET /user_lists.json
  def index
    @user_lists = UserList.where(user_id: current_user.id)
    @users_lists = UserList.all
  end

  # GET /user_lists/1
  # GET /user_lists/1.json
  def show
  end

  # GET /user_lists/new
  def new
    @user_list = UserList.new
  end

  # GET /user_lists/1/edit
  def edit
  end

  # POST /user_lists
  # POST /user_lists.json
  def create
    @user_list = UserList.new(user_list_params)

    respond_to do |format|
      if @user_list.save
        format.html { redirect_to movies_path, notice: 'Filmul a fost adaugat in listele tale' }
        format.json { render :show, status: :created, location: @user_list }
      else
        format.html { render :new }
        format.json { render json: @user_list.errors, status: :unprocessable_entity }
      end
    end
    # redirect_to(:controller => 'movies', :action => 'index')
  end

  # PATCH/PUT /user_lists/1
  # PATCH/PUT /user_lists/1.json
  def change_status
    user_list = UserList.find_by(movie_id: params[:movie_id],user_id: params[:user_id])
      if user_list.status == false
        user_list.update(
          status: true
        )
      else
       user_list.status = false
       user_list.save
      end
      redirect_to user_path(current_user)
  end
  def update
    
  end

  # DELETE /user_lists/1
  # DELETE /user_lists/1.json
  def destroy
    # @user_list = current_user.user_lists.where(movie_id: params[:movie_id])
    # @user_list.destroy
    # respond_to do |format|
    #   format.html { redirect_to user_lists_url, notice: 'User list was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_list
      @user_list = UserList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_list_params
      params.permit(:status, :movie_id, :user_id)
    end

    

end
