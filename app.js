var App;
(function (App) {
    var SimpleController = (function () {
        function SimpleController($scope) {
            this.$scope = $scope;
            $scope.encodeGalang = function (inMessage) {
                if (typeof inMessage === "undefined") { inMessage = ""; }
                return inMessage.replace(/あ/g, 'ぁ').replace(/い/g, 'ぃ').replace(/う/g, 'ぅ').replace(/え/g, 'ぇ').replace(/お/g, 'ぉ').replace(/や/g, 'ゃ').replace(/ゆ/g, 'ゅ').replace(/よ/g, 'ょ').replace(/私は/g, 'ぅちゎ').replace(/わたしは/g, 'ぅちゎ').replace(/私/g, 'ぅち').replace(/わ/g, 'ゎ');
            };
        }
        return SimpleController;
    })();
    App.SimpleController = SimpleController;
})(App || (App = {}));
var App;
(function (App) {
    var Apprication = (function () {
        function Apprication() {
            this.myApp = angular.module('app', []);
            this.myApp.controller('simpleCtrl', App.SimpleController);
        }
        return Apprication;
    })();
    App.Apprication = Apprication;

    new Apprication();
})(App || (App = {}));
