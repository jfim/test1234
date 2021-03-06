class FoosController < ApplicationController

  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]

  before_action :set_foo, only: [:show, :edit, :update, :destroy, :vote]

  # GET /foos
  # GET /foos.json
  def index
    @foos = Foo.all
  end

  # GET /foos/1
  # GET /foos/1.json
  def show
  end

  # GET /foos/new
  def new
    @foo = Foo.new
  end

  # GET /foos/1/edit
  def edit
  end

  # POST /foos
  # POST /foos.json
  def create
    @foo = Foo.new(foo_params)
    @foo.user = current_user

    respond_to do |format|
      if @foo.save
        format.html { redirect_to @foo, notice: 'Foo was successfully created.' }
        format.json { render :show, status: :created, location: @foo }
      else
        format.html { render :new }
        format.json { render json: @foo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foos/1
  # PATCH/PUT /foos/1.json
  def update
    respond_to do |format|
      if @foo.update(foo_params)
        format.html { redirect_to @foo, notice: 'Foo was successfully updated.' }
        format.json { render :show, status: :ok, location: @foo }
      else
        format.html { render :edit }
        format.json { render json: @foo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foos/1
  # DELETE /foos/1.json
  def destroy
    @foo.destroy
    respond_to do |format|
      format.html { redirect_to foos_url, notice: 'Foo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  #->Prelang (voting/acts_as_votable)
  def vote

    direction = params[:direction]

    # Make sure we've specified a direction
    raise "No direction parameter specified to #vote action." unless direction

    # Make sure the direction is valid
    unless ["like", "bad"].member? direction
      raise "Direction '#{direction}' is not a valid direction for vote method."
    end

    @foo.vote_by voter: current_user, vote: direction

    redirect_to action: :index
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foo
      @foo = Foo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def foo_params
      params.require(:foo).permit(:text, :user_id)
    end
end
