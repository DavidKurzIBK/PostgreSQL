CREATE INDEX coumpound_idx
	ON public.title_akas USING btree
	(region ASC NULLS LAST, titleid ASC NULLS LAST)
	TABLESPACE pg_default