class corsMiddleware(object):
    def process_response(self, req, resp):
        resp['Access-Control-Allow-Origin'] = '*'
        # resp["Access-Control-Allow-Headers"] = "Origin, X-Requested-With, Content-Type, Accept, Accept-Language, application/x-www-form-urlencoded, multipart/form-data, text-plain"
        # resp[
        #     'Access-Control-Allow-Headers'] = 'authentication, content-type, accept'
        return resp
