# MYHScrollToTopView
滚动视图点击状态栏可以滑动到最上方

/**
*  在appdelegate调用show 点击状态栏回到最顶部 ios9之后主窗口需要一个rootviewController 所以需要延迟加载 否则会崩溃
*/
+ (void)show;