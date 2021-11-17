class NotesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_response

    skip_before_action :authorize, only: :index


    def index
        notes = Note.all.order(:created_at)
        render json: notes
    end

    def create
        note = @user.notes.create!(note_params)
        render json: note, status: :created
    end

    def update 
        note = Note.find(id: params[:id])
        note.update!(note_params)
        render json: note, status: :accepted
    end

    def show
        note = Note.find(params[:id])
        render json: note
    end

    def destroy
        note = Note.find(params[:id])
        note.destroy
        head :no_content
    end

    private  

    def note_params
        params.permit(:memo, :user_id)
    end

    def render_record_not_found_response(exception)
        render json: { error: `#{excpetion.model} not found`}, status: :not_found
    end
end
