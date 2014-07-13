module App {

    export interface ISimpleScope extends ng.IScope {
        inMessage: string;
        encodeGalang(inMessage: string): string;
    }

    export class SimpleController {

        constructor(private $scope: ISimpleScope) {

            $scope.encodeGalang = (inMessage: string = "")=> {
                return inMessage.replace(/あ/g, 'ぁ')
                                .replace(/い/g, 'ぃ')
                                .replace(/う/g, 'ぅ')
                                .replace(/え/g, 'ぇ')
                                .replace(/お/g, 'ぉ')
                                .replace(/や/g, 'ゃ')
                                .replace(/ゆ/g, 'ゅ')
                                .replace(/よ/g, 'ょ')
                                .replace(/私は/g, 'ぅちゎ')
                                .replace(/わたしは/g, 'ぅちゎ')
                                .replace(/私/g, 'ぅち')
                                .replace(/わ/g, 'ゎ')
                                ;
            }

        }

    }

}
