class ComplaintsController < ApplicationController

    def create
        complaint = Complaint.new(user_id: current_user.id, content: complaint_params[:content])
        company = Company.find(params[:id])
        company.complaints << complaint
        complaint.save
    end





    private
    def complaint_params
        params.require(:complaint).permit(:content)
    end

end
