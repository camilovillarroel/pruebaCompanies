class ComplaintsController < ApplicationController

    def create
        complaint = Complaint.new(user_id: current_user.id, content: complaint_params[:content])
        company = Company.find(params[:id])
        company.complaints << complaint
        complaint.save

        respond_to do |format|
            if complaint.save
              format.html { redirect_to @company, notice: 'complaint was successfully created.' }
              format.json { render :show, status: :created, location: @company }
              format.js { redirect_to company}
            else
              format.html { render :new }
              format.json { render json: complaint.errors, status: :unprocessable_entity }
              format.js { render :error , status: :unprocessable_entity }
              
            end
          end
    end





    private
    def complaint_params
        params.require(:complaint).permit(:content)
    end

end
