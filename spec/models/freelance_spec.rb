require 'rails_helper'

RSpec.describe Freelance, type: :model do
    let(:freelance) { FactoryBot.create(:freelance) }

  describe 'validations' do
    # 名前、メールアドレス、パスワード、郵便番号、都道府県、市町村、建物名があれば有効な状態であること
    it "is valid with a name, email, and password" do
      expect(freelance).to be_valid
    end

    # 名前がなければ無効な状態であること
    it "is invalid without a name" do
      freelance.name = ''
      freelance.valid?
      expect(freelance.errors[:name]).to include("を入力してください")
    end

    # メールアドレスがなければ無効な状態であること
    it "is invalid without a email" do
      freelance.email = ''
      freelance.valid?
      expect(freelance.errors[:email]).to include("を入力してください")
    end

    # パスワードがなければ無効な状態であること
    it "is invalid without a password" do
      freelance.password = nil
      freelance.valid?
      expect(freelance.errors[:password]).to include("を入力してください")
    end

    it 'emailが空では登録できないこと' do
      freelance.email = ''
      freelance.valid?
      expect(freelance.errors[:email]).to include('を入力してください')
    end

    # 郵便番号がなければ無効な状態であること
    it "is invalid without a post_code" do
      freelance.post_code = ''
      freelance.valid?
      expect(freelance.errors[:post_code]).to include("を入力してください")
    end

    # 都道府県がなければ無効な状態であること
    it "is invalid without a address_prefecture" do
      freelance.address_prefecture = ''
      freelance.valid?
      expect(freelance.errors[:address_prefecture]).to include("を入力してください")
    end

    # 住所がなければ無効な状態であること
    it "is invalid without a address_city" do
      freelance.address_city = ''
      freelance.valid?
      expect(freelance.errors[:address_city]).to include("を入力してください")
    end

    # 名前が51文字以上であれば登録できないこと
    it "is invalid if the name is longer than 50 characters" do
      freelance.name = "あ" * 51
      freelance.valid?
      expect(freelance.errors[:name]).to include("は50文字以内で入力してください")
    end

    # メールアドレスが101文字以上であれば登録できないこと
    it "is invalid if the email is longer than 101 characters" do
      freelance.email = "a" * 89 + "@example.com"
      freelance.valid?
      expect(freelance.errors[:email]).to include("は100文字以内で入力してください")
    end

    # メールアドレスは規定の正規表現に従うこと
    # ドメインのないメールアドレスは無効なこと
    it "is invalid with no domain" do
      freelance.email = "test"
      freelance.valid?
      expect(freelance.errors[:email]).to include("は不正な値です")
    end

    # ドメインのあるメールアドレスは有効なこと
    it "is valid with a domain" do
      freelance.email = "test@example.com"
      expect(freelance).to be_valid
    end

    # 重複したメールアドレスなら無効な状態であること
    it "is invalid if email is duplicated" do
      Freelance.create(
        name:  "Sumner",
        email:      "tester@example.com",
        password:   "dottle-nouveau-pavilion-tights-furze",
        post_code:  "1234567",
        address_prefecture: "Tokyo",
        address_city:  "tyuuou",
        address_branch:  "nihonbashi"
      )
      other_freelance = Freelance.new(
        name:  "Sumner2",
        email:      "tester@example.com",
        password:   "dottle-nouveau-pavilion-tights-furze",
        post_code:  "1234567",
        address_prefecture: "Tokyo",
        address_city:  "tyuuou",
        address_branch:  "nihonbashi"
      )
      other_freelance.valid?
      expect(other_freelance.errors[:email]).to include("はすでに存在します")
    end

    # パスワードが5文字以下である場合は登録できないこと
    it "is invalid if the password is shorter than 5 characters" do
      freelance.password = "dottl"
      freelance.valid?
      expect(freelance.errors[:password]).to include("は6文字以上で入力してください")
    end

    # パスワードが6文字以上であれば登録できること
    it "is valid if the password is longer than 6 characters" do
      freelance.password = "dottle"
      expect(freelance).to be_valid
    end

    # 郵便番号が7文字以外であれば登録できないこと
    it "is invalid if post_code is other than 7 characters" do
      freelance.post_code = "123456"
      freelance.valid?
      expect(freelance.errors[:post_code]).to include("は7文字で入力してください")
    end

    # 市町村名が51文字以上であれば登録できないこと
    it "is invalid if the address_city is longer than 51 characters" do
      freelance.address_city = "あ" * 51
      freelance.valid?
      expect(freelance.errors[:address_city]).to include("は50文字以内で入力してください")
    end

    # 建物名が51文字以上であれば登録できないこと
    it "is invalid if the address_branch is longer than 51 characters" do
      freelance.address_branch = "あ" * 51
      freelance.valid?
      expect(freelance.errors[:address_branch]).to include("は50文字以内で入力してください")
    end
  end

  describe "search method" do
    before do
      FactoryBot.create(:freelance, name: "rubyonrails")     # OKパターン
      FactoryBot.create(:freelance, name: "car_onroad")      # OKパターン
      FactoryBot.create(:freelance, name: "train_on_road")   # NGパターン
    end

    # 検索文字列に部分一致するカテゴリを検索できること
    it "can search users if keyword matches partially" do
      freelances = Freelance.search("onr")
      expect(freelances.count).to eq 2
    end

    # 条件に一致するものがない場合、blankとなること
    it "returns blank if keyword matches partially" do
      freelances = Freelance.search("abc")
      expect(freelances.blank?).to be_truthy
    end
  end

  # bcryptによるダイジェスト生成がうまくいくこと
  it "can generate digest successfully by bcrypt" do
    expect(Freelance.digest("test")).to include("$2a")
  end

  # base64によるトークン生成がうまくいくこと
  it "can generate a token successfully by base64" do
    expect(Freelance.new_token.length).to eq 22
  end

  # remember_digestにトークンが保存されること
  it "saves remember digest successfully" do
    expect(freelance.remember_digest).to eq nil
    freelance.remember
    expect(freelance.remember_digest).to include("$2a")
  end

  # ユーザーのremember digestを破棄できること
  it "can delete remember digest" do
    freelance.remember_digest = "test"
    freelance.save
    freelance.forget
    expect(Freelance.find(freelance.id).remember_digest).to eq nil
  end
end
