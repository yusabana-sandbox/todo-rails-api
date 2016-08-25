require 'rails_helper'

RSpec.describe 'UserToken', type: :request do

  describe 'POST /user_token' do

    context 'すでにユーザが存在する場合' do
      let(:password) { 'password' }
      let!(:user) { create(:user, password: password) }

      context '正常にトークンが発行できる場合' do
        it 'return 201 認証が通りJWTトークンが生成される' do
          params.merge!({auth: {username: user.username, password: password}})

          expect { is_expected.to eq 201 }.to_not change { User.count }
          expect(response.body).to be_json_as(jwt: String)
        end
      end

      context '認証できずトークンが発行できない場合' do
        it 'return 404 間違ったパスワード' do
          params.merge!({auth: {username: user.username, password: 'hoge'}})

          expect { is_expected.to eq 404 }.to_not change { User.count }
          expect(response.body).to eq ''
        end

        it 'return 404 パスワードが空'  do
          params.merge!({auth: {username: user.username, password: ''}})

          expect { is_expected.to eq 404 }.to_not change { User.count }
          expect(response.body).to eq ''
        end
      end
    end

    context 'まだユーザが存在しない場合' do
      context '正常にトークンが発行できる場合' do
        it 'return 201 ユーザが作成されJWTトークンが生成される' do
          params.merge!({auth: {username: 'user', password: 'pass'}})

          expect { is_expected.to eq 201 }.to change(User, :count).from(0).to(1)
          expect(response.body).to be_json_as(jwt: String)
        end
      end

      context '認証できずトーク発行できない場合' do
        it 'return 422 ユーザ名が空'  do
          params.merge!({auth: {username: '', password: 'hoge'}})

          expect { is_expected.to eq 422 }.to_not change { User.count }
        end
      end
    end

  end

end
