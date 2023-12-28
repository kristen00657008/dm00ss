/// API路徑
class ApiPath {
  ///目錄查詢 ✅
  static const String GetMenuCategory = "GetMenuCategory";

  ///分公司資料查詢 ✅
  static const String GetOrganizations = "GetOrganizations";

  ///廣告輪播 ✅
  static const String GetAD = "GetAD";

  ///最新消息 ✅
  static const String GetNews = "GetNews";

  ///產品類別查詢 ✅
  static const String Category = "Category";

  ///產品清單查詢 ✅
  static const String Products = "Products";

  ///產品詳情查詢 ✅
  static const String ProductDetail = "ProductDetail";

  ///商品推薦資料 ✅
  static const String GetProductPromote = "GetProductPromote";

  ///會員登入驗證 ✅
  static const String Login = "Login";

  ///會員資料查詢 ✅
  static const String QueryMember = "QueryMember";

  ///會員密碼異動 ✅
  static const String UpdMemberPWD = "UpdMemberPWD";

  ///忘記密碼 ✅
  static const String ForgetPassword = "ForgetPassword";

  ///個人獎金資訊 ❌
  static const String BonusInfo = "BonusInfo";

  /// 線上客服 - 問題類別 ❌
  static const String GetAskType = "GetAskType";

  /// 線上客服 - 主題列表 ❌
  static const String QAList = "QAList";

  /// 線上客服 - 新增發問主題 ❌
  static const String InsQAListA = "InsQAListA";

  /// 線上客服 - 刪除發問主題 ❌
  static const String DelQAListA = "DelQAListA";

  /// 線上客服 - 主題下問答列表 ❌
  static const String QAListB = "QAListB";

  /// 線上客服 - 主題下新增問題 ❌
  static const String InsQAListB = "InsQAListB";

  /// 線上客服 - 設定問答列表已讀 ❌
  static const String SetQAAsRead = "SetQAAsRead";

  ///熱門搜尋字串 ✅
  static const String PopularKeyword = "PopularKeyword";

  ///熱銷商品查詢 ✅
  static const String GetProductPopular = "GetProductPopular";

  /// 快速訂購 ✅
  static const String GetProductQuickOrder = "GetProductQuickOrder";

  /// 推播編號寫入 ✅
  static const String UpdatePushData = "UpdatePushData";

  /// 發送推播 ❌
  static const String SendPushData = "SendPushData";

  /// 推播訊息讀取 ❌
  static const String GetPushDataMsg = "GetPushDataMsg";

  /// 單筆訂單提交 ✅
  static const String InsSalesOrder = "InsSalesOrder";

  /// 運費查詢 ✅
  static const String ShipFee = "ShipFee";

  /// 訂單清單查詢 ✅
  static const String Orders = "Orders";

  /// 訂單詳情 ✅
  static const String OrderDetail = "OrderDetail";

  /// 單筆會員資料提交 ✅
  static const String InsMember = "InsMember";

  /// 各類規章 ✅
  static const String Regulation = "Regulation";

  /// 地址查詢 ✅
  static const String Address = "Address";

  /// 常用收件人清單 ✅
  static const String ReceiverList = "ReceiverList";

  /// 加入常用收件人 ✅
  static const String AddReceiver = "AddReceiver";

  /// 刪除常用收件人 ✅
  static const String DelReceiver = "DelReceiver";

  /// 常用發票載具清單 ✅
  static const String InvoiceCarrierList = "InvoiceCarrierList";

  /// 加入常用發票載具 ✅
  static const String AddInvoiceCarrier = "AddInvoiceCarrier";

  /// 刪除常用發票載具 ✅
  static const String DelInvoiceCarrier = "DelInvoiceCarrier";

  /// 查詢程式版本 ✅
  static const String GetVersion = "GetVersion";

  /// 參數設定查詢 ✅
  static const String GetBWEX = "GetBWEX";

  /// 代碼檔查詢 ✅
  static const String GetCodeType = "GetCodeType";

  /// 代碼檔多筆查詢 ❌
  static const String GetMultiCodeType = "GetMultiCodeType";

  /// 商業邏輯查詢 ✅
  static const String GetCustBusiness = "GetCustBusiness";

  /// 取得地區幣別設定 ✅
  static const String GetRegionCurrency = "GetRegionCurrency";

  /// 傳送App當機資訊 ❌
  static const String SendAppCrashLog = "SendAppCrashLog";

  /// 會員資料異動 ✅
  static const String UpdMember = "UpdMember";

  /// 銀行名稱查詢 ✅
  static const String Bank = "Bank";

  /// 銀行分行查詢 ✅
  static const String BankBranch = "BankBranch";

  /// 捐贈碼及手機條碼驗證 ✅
  static const String CarrierIdValidate = "CarrierIdValidate";

  /// 加入購物車項目 ✅
  static const String AddCartItem = "AddCartItem";

  /// 修改購物車項目 ✅
  static const String UpdateCartItem = "UpdateCartItem";

  /// 移除購物車項目 ✅
  static const String RemoveCartItem = "RemoveCartItem";

  /// 清空購物車 ✅
  static const String EmptyCart = "EmptyCart";

  /// 合併購物車 ✅
  static const String MergeCart = "MergeCart";

  /// 購物車清單 ✅
  static const String GetCartItem = "GetCartItem";

  /// 檢查購物車項目 ✅
  static const String CheckCartItem = "CheckCartItem";

  /// 購物車清單(降低資料庫負載)
  static const String GetCartProduct = "GetCartProduct";

  /// 電子錢包交易記錄查詢 ✅
  static const String QueryEwalletTrade = "QueryEwalletTrade";

  /// 電子錢包餘額查詢 ✅
  static const String QueryEwalletBalance = "QueryEwalletBalance";

  /// 電子錢包轉帳 ✅
  static const String EwalletTransfer = "EwalletTransfer";

  /// 電子錢包密碼驗證 ✅
  static const String AccountPWDValidate = "AccountPWDValidate";

  /// 下載專區資料 ✅
  static const String GetDownloadFile = "GetDownloadFile";

  /// 圖片上傳 ✅
  static const String UploadFiles = "UploadFiles";

  /// 查詢極左/極右安置人會員
  static const String GetParentMember = "GetParentMember";

  /// 取得API時間 ✅
  static const String GetLocalDatetime = "GetLocalDatetime";
}
