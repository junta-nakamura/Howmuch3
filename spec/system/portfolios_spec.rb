require 'rails_helper'

RSpec.describe "ポートフォリオ投稿", type: :system do
  before do
    @user = FactoryBot.build(:user)
    @user.save
    @portfolio = FactoryBot.build(:portfolio)
  end

  context '新規投稿できるとき' do
    it 'ログインしているユーザーが正しく入力すれば新規投稿できる' do
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
      # 新規投稿画面に遷移するボタンがあることを確認する
      expect(page).to have_content('新規投稿')
      # 新規投稿画面に遷移するボタンを押下すると新規投稿画面に遷移する
      click_on '新規投稿'
      expect(current_path).to eq(new_portfolio_path)
      # 投稿内容を入力する
      attach_file 'portfolio_images', 'public/images/test_image.png'
      fill_in 'portfolio_portfolio_name', with: @portfolio.portfolio_name
      fill_in 'portfolio_detail', with: @portfolio.detail
      select 'ITエンジニア', from: 'portfolio[type_id]'
      select 'Java', from: 'portfolio[development_language_id]'
      select 'BtoB', from: 'portfolio[business_type_id]'
      sleep 0.5
      choose 'portfolio_sale_type_id_0'
      fill_in 'portfolio[price]', with: @portfolio.price
      # 新規投稿ボタンを押下するとportfolioモデルのカウントが1上がる
      expect{
        click_on '登録' 
      }.to change{Portfolio.count}.by(1)
      # マイページに遷移する
      expect(current_path).to eq(user_path(@user.id))
    end
  end

  context '新規投稿できないとき' do
    it 'ログインしているユーザーが誤った入力をすると新規投稿できない' do
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
      # 新規投稿画面に遷移するボタンがあることを確認する
      expect(page).to have_content('新規投稿')
      # 新規投稿画面に遷移するボタンを押下すると新規投稿画面に遷移する
      click_on '新規投稿'
      expect(current_path).to eq(new_portfolio_path)
      # 投稿内容を入力する
      # attach_file 'portfolio_images', 'public/images/test_image.png'
      fill_in 'portfolio_portfolio_name', with: ''
      fill_in 'portfolio_detail', with: ''
      # select 'ITエンジニア', from: 'portfolio[type_id]'
      # select 'Java', from: 'portfolio[development_language_id]'
      # select 'BtoB', from: 'portfolio[business_type_id]'
      # choose 'portfolio_sale_type_id_0'
      # fill_in 'portfolio[price]', with: @portfolio.price
      # 新規投稿ボタンを押下してもportfolioモデルのカウントが上がらない
      expect{
        click_on '登録'
      }.to change{Portfolio.count}.by(0)
      # 新規投稿画面へ戻されることを確認する
      expect(current_path).to eq(portfolios_path)
    end
    
    it 'ログインしていないユーザーは新規投稿できない' do
      # トップページに移動する
      visit root_path
      # トップページに新規投稿画面に遷移するボタンがないことを確認する
      expect(page).to have_no_content('新規投稿')
    end
  end
end



RSpec.describe "ポートフォリオ編集", type: :system do
  before do
    @portfolio = FactoryBot.build(:portfolio)
    @portfolio.save
    @portfolio2 = FactoryBot.build(:portfolio)
    @user = @portfolio.user
    @user.save
    @company = FactoryBot.build(:company)
    @company.save
  end

  context '投稿を編集できるとき' do
    it 'ログインしているユーザーは自分の投稿を編集できる' do
      # ログインページに移動する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      # ログインボタンを押下するとマイページに遷移する
      click_on 'ログイン'
      expect(current_path).to eq(user_path(@user.id))
      # 投稿詳細画面に遷移するボタンがあることを確認する
      sleep 0.5
      expect(page).to have_content('詳細')
      # 投稿詳細画面に遷移するボタンを押下すると投稿詳細画面に遷移する
      click_on '詳細'
      expect(current_path).to eq(portfolio_path(@portfolio.id))
      # 編集ページに繊維するボタンがあることを確認する
      expect(page).to have_content('編集')
      # 編集ページに遷移するボタンを押下する
      click_on '編集'
      # 編集ページに遷移する
      expect(current_path).to eq(edit_portfolio_path(@portfolio.id))
      # 既に投稿済みの内容がフォームに入っていることを確認する
      expect(
        find('#portfolio_portfolio_name').value
      ).to eq(@portfolio.portfolio_name)
      expect(
        find('#portfolio_detail').value
      ).to eq(@portfolio.detail)
      # expect(page).to have_select('職種', selected: 1)
      expect(
        find('#development_language_field').value.to_i
      ).to eq(@portfolio.development_language_id)
      expect(
        find('#business_type_field').value.to_i
      ).to eq(@portfolio.business_type_id)
      expect(
        find('#sale_type_field').value.to_i
      ).to eq(@portfolio.sale_type_id)
      # 投稿内容を編集する
      attach_file 'portfolio_images', 'public/images/test_image.png'
      fill_in 'portfolio_portfolio_name', with: @portfolio2.portfolio_name
      fill_in 'portfolio_detail', with: @portfolio2.detail
      select 'ITエンジニア', from: 'portfolio[type_id]'
      select 'Ruby', from: 'portfolio[development_language_id]'
      select 'BtoC', from: 'portfolio[business_type_id]'
      sleep 0.1
      choose 'portfolio_sale_type_id_0'
      fill_in 'portfolio[price]', with: @portfolio2.price
      # 更新ボタンを押下してもportfolioモデルのカウントが上がらないことを確認する
      expect{
        click_on '更新' 
      }.to change{Portfolio.count}.by(0)
      # マイページに遷移する
      expect(current_path).to eq(user_path(@user.id))
    end
  end

  context '投稿を編集できないとき' do
    it 'ログインしているユーザーが正しく入力しなければ編集できない' do
      # ログインページに移動する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      # ログインボタンを押下する
      click_on 'ログイン'
      # マイページに遷移する
      expect(current_path).to eq(user_path(@user.id))
      # 投稿詳細画面に遷移するボタンがあることを確認する
      sleep 0.1
      expect(page).to have_content('詳細')
      # 投稿詳細画面に遷移するボタンを押下すると投稿詳細画面に遷移する
      sleep 0.1
      click_on '詳細'
      expect(current_path).to eq(portfolio_path(@portfolio.id))
      # 編集ページに繊維するボタンがあることを確認する
      expect(page).to have_content('編集')
      # 編集ページに遷移するボタンを押下すると編集ページに遷移する
      sleep 0.1
      click_on '編集'
      expect(current_path).to eq(edit_portfolio_path(@portfolio.id))
      # 既に投稿済みの内容がフォームに入っていることを確認する
      expect(
        find('#portfolio_portfolio_name').value
      ).to eq(@portfolio.portfolio_name)
      expect(
        find('#portfolio_detail').value
      ).to eq(@portfolio.detail)
      # expect(page).to have_select('職種', selected: 1)
      expect(
        find('#development_language_field').value.to_i
      ).to eq(@portfolio.development_language_id)
      expect(
        find('#business_type_field').value.to_i
      ).to eq(@portfolio.business_type_id)
      expect(
        find('#sale_type_field').value.to_i
      ).to eq(@portfolio.sale_type_id)
      # 投稿内容を編集する
      attach_file 'portfolio_images', 'public/images/test_image.png'
      fill_in 'portfolio_portfolio_name', with: ''
      fill_in 'portfolio_detail', with: ''
      # select 'ITエンジニア', from: 'portfolio[type_id]'
      # select 'Ruby', from: 'portfolio[development_language_id]'
      # select 'BtoC', from: 'portfolio[business_type_id]'
      sleep 0.1
      choose 'portfolio_sale_type_id_0'
      fill_in 'portfolio[price]', with: ''
      # 更新ボタンを押すと編集ページに戻される
      click_on '更新'
      expect(current_path).to eq(portfolio_path(@portfolio.id))
    end

    it 'ログインした法人は投稿の編集ができない' do
      # ログインページに遷移する
      visit new_company_session_path
      # 法人情報を入力する
      fill_in 'company_email', with: @company.email
      fill_in 'company_password', with: @company.password
      # ログインボタンを押下する
      click_on 'ログイン'
      # 投稿詳細ページに遷移するボタンがあることを確認する
      expect(page).to have_content('詳細')
      # 投稿詳細ページに遷移するボタンを押下すると投稿詳細ページに遷移する
      click_on '詳細'
      expect(current_path).to eq(portfolio_path(@portfolio.id))
      # 編集ボタンがないことを確認する
      expect(page).to have_no_content('編集')
    end
  end
end


RSpec.describe 'ポートフォリオ削除', type: :system do
  before do
    @portfolio = FactoryBot.build(:portfolio)
    @portfolio.save
    @user = @portfolio.user
    @user.save
    @company = FactoryBot.build(:company)
    @company.save
  end

  context '投稿を削除できるとき' do
    it 'ログインしているユーザーは自分の投稿を削除できる' do
      # ログインページに移動する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      # ログインボタンを押下する
      click_on 'ログイン'
      # マイページに遷移する
      expect(current_path).to eq(user_path(@user.id))
      # 投稿詳細画面に遷移するボタンがあることを確認する
      sleep 0.1
      expect(page).to have_content('詳細')
      # 投稿詳細画面に遷移するボタンを押下すると投稿詳細画面に遷移する
      sleep 0.5
      click_on '詳細'
      expect(current_path).to eq(portfolio_path(@portfolio.id))
      # 削除ボタンがあることを確認する
      expect(page).to have_content('削除')
      # 削除ボタンを押下するとportfolioモデルのカウントが1減ることを確認する
      expect{
        click_on '削除'
      }.to change{Portfolio.count}.by(-1)
      # マイページに遷移することを確認する
      expect(current_path).to eq(user_path(@user.id))
    end
  end

  context '投稿を削除できないとき' do
    it 'ログインした法人は投稿を削除できない' do
      # ログインページに遷移する
      visit new_company_session_path
      # 法人情報を入力する
      fill_in 'company_email', with: @company.email
      fill_in 'company_password', with: @company.password
      # ログインボタンを押下する
      click_on 'ログイン'
      # 投稿詳細ページに遷移するボタンがあることを確認する
      expect(page).to have_content('詳細')
      # 投稿詳細ページに遷移するボタンを押下すると投稿詳細ページに遷移する
      click_on '詳細'
      expect(current_path).to eq(portfolio_path(@portfolio.id))
      # 削除ボタンがないことを確認する
      expect(page).to have_no_content('削除')
    end
  end
end
