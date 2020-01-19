import s3 = require('@aws-cdk/aws-s3');
import cdk = require('@aws-cdk/core');

export class Test extends cdk.Construct {
    constructor(scope: cdk.Construct, id: string) {
        super(scope, id);

        const bucket = new s3.Bucket(this, 'Bucket');
        new cdk.CfnOutput(this, `arn`, { value: bucket.bucketArn });
    }
}
