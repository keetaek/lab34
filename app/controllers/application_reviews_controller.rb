class ApplicationReviewsController < ApplicationController
  # GET /application_reviews
  # GET /application_reviews.json
  def index
    @application_reviews = ApplicationReview.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @application_reviews }
    end
  end

  # GET /application_reviews/1
  # GET /application_reviews/1.json
  def show
    @application_review = ApplicationReview.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @application_review }
    end
  end

  # GET /application_reviews/new
  # GET /application_reviews/new.json
  def new
    @application_review = ApplicationReview.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @application_review }
    end
  end

  # GET /application_reviews/1/edit
  def edit
    @application_review = ApplicationReview.find(params[:id])
  end

  # POST /application_reviews
  # POST /application_reviews.json
  def create
    @application_review = ApplicationReview.new(params[:application_review])

    respond_to do |format|
      if @application_review.save
        format.html { redirect_to @application_review, notice: 'Application review was successfully created.' }
        format.json { render json: @application_review, status: :created, location: @application_review }
      else
        format.html { render action: "new" }
        format.json { render json: @application_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /application_reviews/1
  # PUT /application_reviews/1.json
  def update
    @application_review = ApplicationReview.find(params[:id])

    respond_to do |format|
      if @application_review.update_attributes(params[:application_review])
        format.html { redirect_to @application_review, notice: 'Application review was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @application_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /application_reviews/1
  # DELETE /application_reviews/1.json
  def destroy
    @application_review = ApplicationReview.find(params[:id])
    @application_review.destroy

    respond_to do |format|
      format.html { redirect_to application_reviews_url }
      format.json { head :ok }
    end
  end
end
