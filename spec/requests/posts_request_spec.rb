require 'rails_helper'

RSpec.describe 'Posts API', type: :request do
  let!(:post) { create(:post, up: 60, down: 40) }
  let!(:post_2) { create(:post, up: 6, down: 4) }
  let!(:post_3) { create(:post, up: 600, down: 400) }

  describe 'PUT /upvote/:post_id' do
    context 'when the record does not exist' do
      before { put '/upvote/0' }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Post with 'id'=0/)
      end
    end

    context 'when the record exists' do
      before { put "/upvote/#{post.id}" }

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the record' do
        expect(response.body).to be_empty
      end
    end
  end

  describe 'PUT /downvote/:post_id' do
    context 'when the record does not exist' do
      before { put '/downvote/0' }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Post with 'id'=0/)
      end
    end

    context 'when the record exists' do
      before { put "/downvote/#{post.id}" }

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the record' do
        expect(response.body).to be_empty
      end
    end
  end

  describe 'GET /posts' do
    context 'when the records exists' do
      before { get '/posts' }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'list objects' do
        expect(JSON.parse(response.body)[0]['rate']).to be(60.0)
        expect(JSON.parse(response.body)[0]['up']).to be(post_3.up)

        expect(JSON.parse(response.body)[1]['rate']).to be(60.0)
        expect(JSON.parse(response.body)[1]['up']).to be(post.up)

        expect(JSON.parse(response.body)[2]['rate']).to be(60.0)
        expect(JSON.parse(response.body)[2]['up']).to be(post_2.up)
      end
    end
  end
end
