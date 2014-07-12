module App {

    export interface ISimpleScope extends ng.IScope {
        hoge: string;
    }

    export class SimpleController {

        constructor(private $scope: ISimpleScope) {
        }

    }

}
