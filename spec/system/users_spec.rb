require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録できるとき' do
    it "正しい情報を入力すればユーザー新規登録ができ新規投稿画面に遷移する" do
      # トップページに移動する
      visit root_path
      # トップページにサインアップボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # サインアップボタンを押下する
      click_on '新規登録'
      # 新規登録ページに遷移する
      expect(current_path).to eq(new_user_registration_path)
      # ユーザー情報を入力する
      attach_file 'user_user_image', 'public/images/test_image.png'
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      fill_in 'user_password_confirmation', with: @user.password
      fill_in 'user_nickname', with: @user.nickname
      fill_in 'user_last_name', with: @user.last_name
      fill_in 'user_first_name', with: @user.first_name
      fill_in 'user_last_name_kana', with: @user.last_name_kana
      fill_in 'user_first_name_kana', with: @user.first_name_kana
      select 'ITエンジニア', from: 'user[type_id]'
      select '1930', from: 'user_birthday_1i'
      select '1', from: 'user_birthday_2i'
      select '1', from: 'user_birthday_3i'
      fill_in 'user_introduction', with: @user.introduction
      # 新規登録ボタンを押下するとuserモデルのカウントが1上がる
      expect{
        click_on '新規登録'
      }.to change{User.count}.by(1)
      # 新規投稿画面に遷移する
      expect(current_path).to eq(new_portfolio_path)
      # マイページやログアウトボタンが表示されている
      expect(page).to have_content('マイページ')
      expect(page).to have_content('ログアウト')
      # 新規登録やログインボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end

  context 'ユーザー新規登録できないとき' do
    it "誤った情報では新規登録できず新規登録画面へ戻される" do
      # トップページに移動する
      visit root_path
      # 新規登録ページに遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページに遷移するボタンを押下する
      click_on '新規登録'
      # 新規登録ページに遷移する
      expect(current_path).to eq(new_user_registration_path)
      # ユーザー情報を入力する
      # fill_in 'user_user_image', with: ""
      fill_in 'user_email', with: ""
      fill_in 'user_password', with: ""
      fill_in 'user_password_confirmation', with: ""
      fill_in 'user_nickname', with: ""
      fill_in 'user_last_name', with: ""
      fill_in 'user_first_name', with: ""
      fill_in 'user_last_name_kana', with: ""
      fill_in 'user_first_name_kana', with: ""
      # expect(item_category).to be_blank
      # select '', from: 'user[type_id]'
      # select '', from: 'user_birthday_1i'
      # select '', from: 'user_birthday_2i'
      # select '', from: 'user_birthday_3i'
      fill_in 'user_introduction', with: ""
      # 新規登録ボタンを押下してもuserモデルのカウントが上がらない
      expect{
        click_on '新規登録'
      }.to change{User.count}.by(0)
      # 新規登録画面へ戻されることを確認する
      expect(current_path).to eq(user_registration_path)
    end
  end
end



RSpec.describe "ユーザーログイン", type: :system do
  before do
    @user = FactoryBot.build(:user)
    @user.save
  end
  context 'ログインできるとき' do
    it '保存されているユーザー情報と合致すればログインできる' do
      # トップページに移動する
      visit root_path
      # ログインページに遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページに遷移するボタンを押下する
      click_on 'ログイン'
      # ログインページに遷移する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      # ログインボタンを押下する
      click_on 'ログイン'
      # マイページに遷移する
      expect(current_path).to eq(user_path(@user.id))
      # 新規投稿やログアウトボタンが表示されていることを確認する
      expect(page).to have_content('新規投稿')
      expect(page).to have_content('ログアウト')
      # 新規登録やログインボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end

  context 'ログインできないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      # トップページに移動する
      visit root_path
      # ログインページに遷移するボタンがあることを確認する
      expect(page).to have_content("ログイン")
      # ログインページに遷移するボタンを押下する
      click_on 'ログイン'
      # ログインページに遷移する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
      # ログインボタンを押下する
      click_on 'ログイン'
      # ログインページへ戻されることを確認する
      expect(current_path).to eq(new_user_session_path)
    end
  end

end