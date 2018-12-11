RSpec.describe Api::V1::PerformanceDataController, type: :request do
        let(:user1) { FactoryBot.create(:user, email: 'user1@random.com') }
        let(:user2) { FactoryBot.create(:user, email: 'user2@random.com') }

        let(:credentials) { user1.create_new_auth_token } 
        # token for user1 that the backend creates

        let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) } 
        # basically says the data I'm sending will be in json format
        # 'headers' is info about the type of data you're sending and some technical data related to that response request
        
    describe 'POST /api/v1/performance_data' do
        it 'creates a data entry' do
            post '/api/v1/performance_data', params: {
            performance_data: { data: { message: 'Average' } }
            }, headers: headers
    
            entry = PerformanceData.last
            expect(entry.data).to eq 'message' => 'Average'
        end
    end

    describe 'GET /api/v1/performance_data' do
        before do
            5.times { user1.performance_data.create(data: { message: 'Average' }) }
            5.times { user2.performance_data.create(data: { message: 'Average' }) }
        end
      
        it 'returns a collection of performance data for the given user' do
            get '/api/v1/performance_data', headers: headers
            expect(response_json['entries'].count).to eq 5
            response_json['entries'].each do |entry|
                expect(entry['user_id']).to eq user1.id
            end
        end  
    end

end

