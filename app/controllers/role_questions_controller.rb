class RoleQuestionsController < ApplicationController
  # GET /role_questions
  # GET /role_questions.json
  def index
    @role_questions = RoleQuestion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @role_questions }
    end
  end

  # GET /role_questions/1
  # GET /role_questions/1.json
  def show
    @role_question = RoleQuestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @role_question }
    end
  end

  # GET /role_questions/new
  # GET /role_questions/new.json
  def new
    @role_question = RoleQuestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @role_question }
    end
  end

  # GET /role_questions/1/edit
  def edit
    @role_question = RoleQuestion.find(params[:id])
  end

  # POST /role_questions
  # POST /role_questions.json
  def create
    @role_question = RoleQuestion.new(params[:role_question])

    respond_to do |format|
      if @role_question.save
        format.html { redirect_to @role_question, notice: 'Role question was successfully created.' }
        format.json { render json: @role_question, status: :created, location: @role_question }
      else
        format.html { render action: "new" }
        format.json { render json: @role_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /role_questions/1
  # PUT /role_questions/1.json
  def update
    @role_question = RoleQuestion.find(params[:id])

    respond_to do |format|
      if @role_question.update_attributes(params[:role_question])
        format.html { redirect_to @role_question, notice: 'Role question was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @role_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /role_questions/1
  # DELETE /role_questions/1.json
  def destroy
    @role_question = RoleQuestion.find(params[:id])
    @role_question.destroy

    respond_to do |format|
      format.html { redirect_to role_questions_url }
      format.json { head :ok }
    end
  end
end
