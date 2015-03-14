module Api
  class ResponsesController < Api::BaseController

    private

      def response_params
        params.require(:response).permit(
          :quest_id,
          :author,
          :value,
          :vat,
          :request_ip,
          :request_header,
          :session_id)
      end

      def query_params
        # this assumes that an album belongs to an artist and has an :artist_id
        # allowing us to filter by this
        params.permit(:query_id, :value)
      end

  end
end
