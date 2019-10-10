

require_relative '../lib/coin_market_crypto.rb'

​

​

describe "coin_tab" do

​

    it "returns a tab" do

        coin = Array.new

        tab = coin_tab (coin)

        expect(tab.count).to eq(2399)

    end

​

    it "countains" do

        coin = Array.new

        tab = coin_tab (coin)

        expect(tab.include?("Bitcoin")).to eq(true)

    end

​

end

​

​

​

describe "zip_tab" do

​

    it "returns 2399 elements" do

        tab1 = Array.new

        tab2 = Array.new

        expect(zip_tap(coin_tab(tab1), price_tab(tab2)).count).to eq(2393)

    end

    

end