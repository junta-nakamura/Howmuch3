require 'rails_helper'

RSpec.describe "法人新規登録", type: :system do
  before do
    @company = FactoryBot.build(:company)
  end

  context '法人新規登録できるとき' do
    it "正しい情報を入力すれば法人新規登録ができ新規投稿画面に遷移する" do
      # トップページに移動する
      visit root_path
      # トップページにサインアップボタンがあることを確認する
      expect(page).to have_content('法人新規登録')
      # サインアップボタンを押下する
      click_on '法人新規登録'
      # 新規登録ページに遷移する
      expect(current_path).to eq(new_company_registration_path)
      # 法人情報を入力する
      attach_file 'company_company_image', 'public/images/test_image.png'
      fill_in 'company_email', with: @company.email
      fill_in 'company_password', with: @company.password
      fill_in 'company_password_confirmation', with: @company.password
      fill_in 'company_company_name', with: @company.company_name
      fill_in 'company_company_phone', with: @company.company_phone
      fill_in 'company_postal_code', with: @company.postal_code
      select '東京都', from: 'company_prefecture_id'
      fill_in 'company_municipalities', with: @company.municipalities
      fill_in 'company_house_number', with: @company.house_number
      # 新規登録ボタンを押下するとcompanyモデルのカウントが1上がる
      expect{
        click_on '新規登録'
      }.to change{Company.count}.by(1)
      # 投稿一覧画面に遷移する
      expect(current_path).to eq(portfolios_path)
      # マイページやログアウトボタンが表示されている
      expect(page).to have_content('マイページ')
      expect(page).to have_content('ログアウト')
      # 新規登録やログインボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end

  context '法人新規登録できないとき' do
    it '誤った情報では新規登録できず新規登録画面に留まる' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップボタンがあることを確認する
      expect(page).to have_content('法人新規登録')
      # サインアップボタンを押下する
      click_on '法人新規登録'
      # 新規登録ページに遷移する
      expect(current_path).to eq(new_company_registration_path)
      # 法人情報を入力する
      # attach_file 'company_company_image', 'public/images/test_image.png'
      fill_in 'company_email', with: ''
      fill_in 'company_password', with: ''
      fill_in 'company_password_confirmation', with: ''
      fill_in 'company_company_name', with: ''
      fill_in 'company_company_phone', with: ''
      fill_in 'company_postal_code', with: ''
      # select '東京都', from: 'company_prefecture_id'
      fill_in 'company_municipalities', with: ''
      fill_in 'company_house_number', with: ''
      # 新規登録ボタンを押下してもcompanyモデルのカウントが上がらない
      expect{
        click_on '新規登録'
      }.to change{Company.count}.by(0)
      # 新規登録画面に留まる
      expect(current_path).to eq(company_registration_path)
    end
  end

end



RSpec.describe "法人ログイン", type: :system do
  before do
    @company = FactoryBot.build(:company)
    @company.save
  end
  context 'ログインできるとき' do
    it '保存されている法人情報と合致すればログインできる' do
      # トップページに移動する
      visit root_path
      # トップページにログインボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインボタンを押下する
      click_on 'ログイン'
      # ログインページに遷移する
      visit new_company_session_path
      # 法人情報を入力する
      fill_in 'company_email', with: @company.email
      fill_in 'company_password', with: @company.password
      # ログインボタンを押下する
      click_on 'ログイン'
      # マイページに遷移する
      expect(current_path).to eq(portfolios_path)
      # マイページやログアウトボタンが表示されていることを確認する
      expect(page).to have_content('マイページ')
      expect(page).to have_content('ログアウト')
      # 新規登録やログインボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end
  
  context 'ログインができないとき' do
    it '保存されている法人の情報と合致しないとログインができない' do
      # トップページに移動する
      visit root_path
      # トップページにログインボタンがあることを確認する
      expect(page).to have_content("ログイン")
      # ログインボタンを押下する
      click_on 'ログイン'
      # ログインページに遷移する
      visit new_company_session_path
      # ユーザー情報を入力する
      fill_in 'company_email', with: ''
      fill_in 'company_password', with: ''
      # ログインボタンを押下する
      click_on 'ログイン'
      # ログインページへ戻されることを確認する
      expect(current_path).to eq(new_company_session_path)
    end
  end

end
