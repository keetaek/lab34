class ApplicationQuestionAnswersController < ApplicationController
  # GET /application_question_answers
  # GET /application_question_answers.json
  def index
    @application_question_answers = ApplicationQuestionAnswer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @application_question_answers }
    end
  end

  # GET /application_question_answers/1
  # GET /application_question_answers/1.json
  def show
    @application_question_answer = ApplicationQuestionAnswer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @application_question_answer }
    end
  end

  # GET /application_question_answers/new
  # GET /application_question_answers/new.json
  def new
    @application_question_answer = ApplicationQuestionAnswer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @application_question_answer }
    end
  end

  # GET /application_question_answers/1/edit
  def edit
    @application_question_answer = ApplicationQuestionAnswer.find(params[:id])
  end

  # POST /application_question_answers
  # POST /application_question_answers.json
  def create
    @application_question_answer = ApplicationQuestionAnswer.new(params[:application_question_answer])

    respond_to do |format|
      if @application_question_answer.save
        format.html { redirect_to @application_question_answer, notice: 'Application question answer was successfully created.' }
        format.json { render json: @application_question_answer, status: :created, location: @application_question_answer }
      else
        format.html { render action: "new" }
        format.json { render json: @application_question_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /application_question_answers/1
  # PUT /application_question_answers/1.json
  def update
    @application_question_answer = ApplicationQuestionAnswer.find(params[:id])

    respond_to do |format|
      if @application_question_answer.update_attributes(params[:application_question_answer])
        format.html { redirect_to @application_question_answer, notice: 'Application question answer was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @application_question_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /application_question_answers/1
  # DELETE /application_question_answers/1.json
  def destroy
    @application_question_answer = ApplicationQuestionAnswer.find(params[:id])
    @application_question_answer.destroy

    respond_to do |format|
      format.html { redirect_to application_question_answers_url }
      format.json { head :ok }
    end
  end
end
